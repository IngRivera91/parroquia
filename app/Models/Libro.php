<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

/**
 * @property int $id
 * @property int $tipo_acta_id
 * @property TipoActa $tipo_acta
 * @property int $numero
 * @property string $label
 * @property int $created_user_id
 * @property int $updated_user_id
 */
class Libro extends Model
{
    const NOMBRE_TABLA = 'libros';
    protected $table = 'libros';

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'tipo_acta_id',
        'numero',
        'description_select',
        'label',
        'activo',
        'created_user_id',
        'updated_user_id',
    ];

    public function tipo_acta(): BelongsTo
    {
        return $this->belongsTo(TipoActa::class)->orderBy('name','ASC');
    }
}
