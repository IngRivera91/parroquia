<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property string $name
 * @property string $label
 * @property int $activo
 * @property int|null $created_user_id
 * @property int|null $updated_user_id
 */
class Rol extends Model
{
    const NOMBRE_TABLA = 'roles';
    protected $table = 'roles';

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'name',
        'label',
        'activo',
        'created_user_id',
        'updated_user_id',
    ];
}
