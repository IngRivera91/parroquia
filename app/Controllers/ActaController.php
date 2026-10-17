<?php

namespace App\Controllers;

use App\Class\BaseController;
use App\Class\Html;
use App\Class\Redireccion;
use App\Models\Acta;
use App\Models\ActaPersona;
use App\Models\Menu;
use App\Models\Method;
use App\Models\MethodBase;
use App\Models\Persona;
use App\Models\TipoActa;
use Illuminate\Database\Capsule\Manager as Capsule;
use Throwable;

class ActaController extends BaseController
{

    public array $tiposActa;
    public string $llave;
    public function __construct()
    {
        $this->model = Acta::class;
        $this->nameController = 'Acta';
        $this->nameModel = 'Acta';

        $this->tiposActa = TipoActa::query()->get()->toArray();

        parent::__construct();
    }

    public function lista()
    {
        $this->breadcrumb = false;

        $this->camposLista = [
            'Id' => 'id',
            'Numero Acta' => 'numero_acta',
            'Numero Titulares' => 'numero_titulares',
            'Activo' => 'activo'
        ];

        parent::lista();
    }

    public function generaInputFiltros (array $datosFiltros): void
    {
        $col = 3;
        $this->sizeColumnasInputsFiltros = $col;

        $datos['Acta+numero_acta'] = '';

        foreach ($datosFiltros as $key => $filtro) {
            $datos[$key] = $filtro;
        }

        $tablaCampo = 'Acta+numero_acta';
        $placeholder = '';

        $this->htmlInputFiltros[$tablaCampo] = Html::inputText($col,'Numero Acta',1,$tablaCampo,$placeholder,$datos[$tablaCampo]);
    }

    public function registrar()
    {
        $this->breadcrumb = false;
        $this->llave = $this->llaveFormulario;
    }


    /**
     * @throws Throwable
     */
    public function registrarBd(bool $noRedirect = false)
    {
        $datos = $this->validaDatosFormulario();

        Capsule::connection()->beginTransaction();

        try {

            /*
             * Registrar acta
             */
            $acta = Acta::query()->create([
                'libro_id' => $datos['libro_id'],
                'numero_hoja' => $datos['numero_hoja'],
                'numero_acta' => $datos['numero_acta'],
                'fecha' => $datos['fecha'] ?: null,
                'observaciones' => $datos['observaciones'] ?: null,
                'activo' => 1,
                'created_user_id' => USUARIO_ID,
                'updated_user_id' => USUARIO_ID,
            ]);

            /*
             * Registrar titular 1
             */
            $persona1 = $this->obtieneOCreaPersona([
                'name' => $datos['titular_1_name'],
                'apellido_paterno' => $datos['titular_1_apellido_paterno'] ?: null,
                'apellido_materno' => $datos['titular_1_apellido_materno'] ?: null,
                'fecha_nacimiento' => $datos['titular_1_fecha_nacimiento'] ?: null,
            ]);

            /*
             * Relacionar titular 1 con el acta
             */
            ActaPersona::query()->create([
                'acta_id' => $acta->id,
                'persona_id' => $persona1->id,
                'rol_id' => ROL_TITULAR_ID,
                'created_user_id' => USUARIO_ID,
                'updated_user_id' => USUARIO_ID,
            ]);

            /*
             * Registrar titular 2 solamente si existe
             */
            if (!empty($datos['titular_2_name'])) {

                $persona2 = $this->obtieneOCreaPersona([
                    'name' => $datos['titular_2_name'],
                    'apellido_paterno' => $datos['titular_2_apellido_paterno'] ?: null,
                    'apellido_materno' => $datos['titular_2_apellido_materno'] ?: null,
                    'fecha_nacimiento' => $datos['titular_2_fecha_nacimiento'] ?: null,
                ]);

                /*
                 * Relacionar titular 2 con el acta
                 */
                ActaPersona::query()->create([
                    'acta_id' => $acta->id,
                    'persona_id' => $persona2->id,
                    'rol_id' => ROL_TITULAR_ID,
                    'created_user_id' => USUARIO_ID,
                    'updated_user_id' => USUARIO_ID,
                ]);
            }

            Capsule::connection()->commit();

            if ($noRedirect) {
                return $acta;
            }

            $mensaje = 'datos registrados';
            Redireccion::enviar(
                'Persona',
                'lista',
                SESSION_ID,
                $mensaje
            );
            exit;

        } catch (\Exception $e) {

            Capsule::connection()->rollBack();

            if (DEBUG_MODE) {
                throw $e;
            }

            $mensaje = 'error al registrar el acta';

            Redireccion::enviar(
                $this->nameController,
                'registrar',
                SESSION_ID,
                $mensaje
            );
            exit;
        }
    }

    private function obtieneOCreaPersona(array $datos): Persona
    {
        $consulta = Persona::query()
            ->whereRaw(
                'LOWER(name) = LOWER(?)',
                [$datos['name']]
            );

        if ($datos['apellido_paterno'] === null) {
            $consulta->whereNull('apellido_paterno');
        } else {
            $consulta->whereRaw(
                'LOWER(apellido_paterno) = LOWER(?)',
                [$datos['apellido_paterno']]
            );
        }

        if ($datos['apellido_materno'] === null) {
            $consulta->whereNull('apellido_materno');
        } else {
            $consulta->whereRaw(
                'LOWER(apellido_materno) = LOWER(?)',
                [$datos['apellido_materno']]
            );
        }

        if ($datos['fecha_nacimiento'] === null) {
            $consulta->whereNull('fecha_nacimiento');
        } else {
            $consulta->where(
                'fecha_nacimiento',
                $datos['fecha_nacimiento']
            );
        }

        $persona = $consulta->first();

        if (!$persona) {
            $persona = Persona::query()->create([
                'name' => $datos['name'],
                'apellido_paterno' => $datos['apellido_paterno'],
                'apellido_materno' => $datos['apellido_materno'],
                'fecha_nacimiento' => $datos['fecha_nacimiento'],
                'activo' => 1,
                'created_user_id' => USUARIO_ID,
                'updated_user_id' => USUARIO_ID,
            ]);
        }

        return $persona;
    }





}
