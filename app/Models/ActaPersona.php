<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

/**
 * @property int $id
 * @property int $acta_id
 * @property int $persona_id
 * @property int $rol_id
 * @property int|null $created_user_id
 * @property int|null $updated_user_id
 * @property Acta $acta
 * @property Persona $persona
 * @property Rol $rol
 */
class ActaPersona extends Model
{
    const NOMBRE_TABLA = 'actas_personas';
    protected $table = 'actas_personas';

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'acta_id',
        'persona_id',
        'rol_id',
        'created_user_id',
        'updated_user_id',
    ];

    public function acta(): BelongsTo
    {
        return $this->belongsTo(Acta::class);
    }

    public function persona(): BelongsTo
    {
        return $this->belongsTo(Persona::class);
    }

    public function rol(): BelongsTo
    {
        return $this->belongsTo(Rol::class);
    }
}
