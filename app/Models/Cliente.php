<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Cliente extends Model
{
    //
    use HasFactory;

    protected $guarded = [];

    public function tipos():HasMany
    {
        return $this->hasMany(Tipo::class);
    }

    public function regimens():HasMany
    {
        return $this->hasMany(Regimen::class);
    }

    public function declaracions():HasMany
    {
        return $this->hasMany(Declaracion::class);
    }

    public function users():HasMany
    {
        return $this->hasMany(User::class);
    }

    public function provincias():HasMany
    {
        return $this->hasMany(Provincia::class);
    }

    public function accesos():HasMany
    {
        return $this->hasMany(Acceso::class);
    }

    public function tramites():HasMany
    {
        return $this->hasMany(Tramite::class);
    }


}
