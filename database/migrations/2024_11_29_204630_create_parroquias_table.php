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
        Schema::create('parroquias', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('provinciaId');
            $table->foreign('provinciaId')->references('id')->on('provincias');
            $table->unsignedBigInteger('cantonId');
            $table->foreign('cantonId')->references('id')->on('cantons');
            $table->string('parroquia');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('parroquias');
    }
};
