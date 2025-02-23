<?php

namespace App\Filament\Resources\TramiteResource\Pages;

use App\Filament\Resources\TramiteResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListTramites extends ListRecords
{
    protected static string $resource = TramiteResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
