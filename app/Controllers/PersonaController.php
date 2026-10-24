<?php

namespace App\Controllers;

use App\Class\BaseController;
use App\Class\Html;
use App\Models\Persona;

class PersonaController extends BaseController
{
    public Persona $persona;
    public function __construct()
    {
        $this->model = Persona::class;
        $this->nameController = 'Persona';
        $this->nameModel = 'Persona';
        parent::__construct();
    }

    public function lista()
    {
        $this->breadcrumb = false;

        $this->camposLista = [
            'Id' => 'id',
            'Nombre' => 'name',
            'Apellido Paterno' => 'apellido_paterno',
            'Apellido Materno' => 'apellido_materno',
            'Activo' => 'activo'
        ];

        parent::lista();
    }

    public function generaInputFiltros (array $datosFiltros): void
    {
        $col = 3;
        $this->sizeColumnasInputsFiltros = $col;

        $datos['Persona+name'] = '';
        $datos['Persona+apellido_paterno'] = '';
        $datos['Persona+apellido_materno'] = '';

        foreach ($datosFiltros as $key => $filtro) {
            $datos[$key] = $filtro;
        }

        $placeholder = '';

        $tablaCampo = 'Persona+name';
        $this->htmlInputFiltros[$tablaCampo] = Html::inputText($col,'Nombre',1,$tablaCampo,$placeholder,$datos[$tablaCampo]);

        $tablaCampo = 'Persona+apellido_paterno';
        $this->htmlInputFiltros[$tablaCampo] = Html::inputText($col,'Apellido Paterno',1,$tablaCampo,$placeholder,$datos[$tablaCampo]);

        $tablaCampo = 'Persona+apellido_materno';
        $this->htmlInputFiltros[$tablaCampo] = Html::inputText($col,'Apellido Materno',1,$tablaCampo,$placeholder,$datos[$tablaCampo]);
    }

    public function verActas (bool $noRedirect = false)
    {
        $this->breadcrumb = false;

        $this->obtieneActas();
    }

    private function obtieneActas(): void
    {
        $registroId = $this->validaRegistoId();

        $this->persona = Persona::query()
            ->with([
                'actas_personas.acta.libro.tipo_acta',
                'actas_personas.rol',
            ])
            ->find($registroId);
    }


}
