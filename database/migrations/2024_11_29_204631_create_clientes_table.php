<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('clientes', function (Blueprint $table) {
            $table->id();
            $table->string('ruc');
            $table->string('empresa');
            $table->string('nombres');
            $table->string('apellidos');
            $table->string('email');
            $table->string('telefono');
            $table->string('celular');
            $table->unsignedBigInteger('provinciaId');
            $table->foreign('provinciaId')->references('id')->on('provincias');
            $table->unsignedBigInteger('cantonId');
            $table->foreign('cantonId')->references('id')->on('cantons');
            $table->unsignedBigInteger('parroquiaId');
            $table->foreign('parroquiaId')->references('id')->on('parroquias');
            $table->string('sectorHogar');
            $table->string('sectorNegocio');
            $table->string('direccionHogar');
            $table->string('direccionNegocio');
            $table->string('coordenadasHogar');
            $table->string('coordenadasNegocio');
            $table->string('imgHogar');
            $table->string('imgNegocio');
            $table->unsignedBigInteger('tipoId');
            $table->foreign('tipoId')->references('id')->on('tipos');
            $table->unsignedBigInteger('regimenId');
            $table->foreign('regimenId')->references('id')->on('regimens');
            $table->unsignedBigInteger('declaracionId');
            $table->foreign('declaracionId')->references('id')->on('declaracions');
            $table->unsignedBigInteger('usuarioId');
            $table->foreign('usuarioId')->references('id')->on('users');
            $table->boolean('obligado');
            $table->boolean('agente');
            $table->boolean('gran');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('clientes');
    }
};
