<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property int $libro_id
 * @property int $numero_hoja
 * @property int $numero_acta
 * @property string $fecha
 * @property string $observaciones
 * @property int $created_user_id
 * @property int $updated_user_id
 */
class Acta extends Model
{
    const NOMBRE_TABLA = 'actas';
    protected $table = 'actas';

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'libro_id',
        'numero_hoja',
        'numero_acta',
        'fecha',
        'observaciones',
        'activo',
        'created_user_id',
        'updated_user_id',
    ];
}