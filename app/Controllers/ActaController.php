<?php

namespace App\Controllers;

use App\Class\BaseController;
use App\Class\Html;
use App\Class\Redireccion;
use App\Models\Acta;
use App\Models\Menu;
use App\Models\Method;
use App\Models\MethodBase;
use App\Models\TipoActa;

class ActaController extends BaseController
{

    public array $tiposActa;
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

    }



    public function registrarBd(bool $noRedirect = false)
    {

    }





}
