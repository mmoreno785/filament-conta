<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Tramite extends Model
{
    //
    use HasFactory;

    protected $guarded=[];

    public function cliente():BelongsTo
    {
        return $this->belongsTo(Cliente::class);
    }

    /*public function catalogos():HasMany
    {
        return $this->hasMany(Catalogo::class);
    }*/

    public function catalogo():BelongsTo
    {
        return $this->belongsTo(Catalogo::class);
    }
}
