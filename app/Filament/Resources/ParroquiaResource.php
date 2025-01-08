<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ParroquiaResource\Pages;
use App\Filament\Resources\ParroquiaResource\RelationManagers;
use App\Models\Canton;
use App\Models\Parroquia;
use App\Models\Provincia;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Forms\Get;
use Filament\Forms\Set;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Collection;

class ParroquiaResource extends Resource
{
    protected static ?string $model = Parroquia::class;

    protected static ?string $navigationGroup = 'Configuración del Sistema';

    

    protected static ?string $navigationIcon = 'heroicon-o-building-storefront';

        protected static ?int $navigationSort = 10;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('provinciaId')
                    ->options(fn(Get $get): Collection => Provincia::query()
                    ->pluck('provincia','id'))
                    ->searchable()
                    ->preload()
                    ->live()
                    ->afterStateUpdated(fn(Set $set)=>$set('cantonId',null))
                    ->required(),
                Forms\Components\Select::make('cantonId')
                    ->options(fn(Get $get): Collection => Canton::query()
                        ->where('provinciaId',$get('provinciaId'))
                        ->pluck('canton','id'))
                    ->searchable()
                    ->preload()
                    ->live()
                    ->required(),

                
                Forms\Components\TextInput::make('parroquia')
                    ->required()
                    ->maxLength(255),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('idCanton')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('parroquia')
                    ->searchable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListParroquias::route('/'),
            'create' => Pages\CreateParroquia::route('/create'),
            'edit' => Pages\EditParroquia::route('/{record}/edit'),
        ];
    }
}
