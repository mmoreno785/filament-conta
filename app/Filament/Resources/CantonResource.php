<?php

namespace App\Filament\Resources;

use App\Filament\Resources\CantonResource\Pages;
use App\Filament\Resources\CantonResource\RelationManagers;
use App\Models\Canton;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class CantonResource extends Resource
{
    protected static ?string $model = Canton::class;

    protected static ?string $navigationLabel = "Cantones";

    protected static ?string $navigationGroup = 'Configuración del Sistema';

    protected static ?string $navigationIcon = 'heroicon-o-building-office-2';

    protected static ?int $navigationSort = 9;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('provinciaId')
                    ->relationship(name:'provincia', titleAttribute:'provincia')
                    ->searchable()
                    ->preload()
                    ->live()
                    ->required(),
                
                Forms\Components\TextInput::make('canton')
                    ->required()
                    ->maxLength(255),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('provinciaId')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('canton')
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
            'index' => Pages\ListCantons::route('/'),
            'create' => Pages\CreateCanton::route('/create'),
            'edit' => Pages\EditCanton::route('/{record}/edit'),
        ];
    }
}
