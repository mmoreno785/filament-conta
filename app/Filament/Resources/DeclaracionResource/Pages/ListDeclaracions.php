<?php

namespace App\Filament\Resources\DeclaracionResource\Pages;

use App\Filament\Resources\DeclaracionResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListDeclaracions extends ListRecords
{
    protected static string $resource = DeclaracionResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
