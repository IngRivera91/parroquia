<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

/**
 * @property int $id
 * @property string $name
 * @property string|null $apellido_paterno
 * @property string|null $apellido_materno
 * @property string|null $fecha_nacimiento
 * @property int $activo
 * @property int|null $created_user_id
 * @property int|null $updated_user_id
 */
class Persona extends Model
{
    const NOMBRE_TABLA = 'personas';
    protected $table = 'personas';

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'name',
        'apellido_paterno',
        'apellido_materno',
        'fecha_nacimiento',
        'activo',
        'created_user_id',
        'updated_user_id',
    ];

    public function actas_personas(): HasMany
    {
        return $this->hasMany(ActaPersona::class);
    }
}