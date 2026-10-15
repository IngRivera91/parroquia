<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

/**
 * @property int $id
 * @property int $numero_titulares
 * @property string $name
 * @property string $label
 * @property int $created_user_id
 * @property int $updated_user_id
 */
class TipoActa extends Model
{
    const NOMBRE_TABLA = 'tipos_acta';
    protected $table = 'tipos_acta';

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'name',
        'label',
        'numero_titulares',
        'activo',
        'created_user_id',
        'updated_user_id',
    ];

    public function libros(): HasMany
    {
        return $this->hasMany(Libro::class)->orderBy('numero','ASC');
    }
}
