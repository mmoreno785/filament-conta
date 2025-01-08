<?php

namespace App\Filament\Resources;

use App\Filament\Resources\AccesoResource\Pages;
use App\Filament\Resources\AccesoResource\RelationManagers;
use App\Models\Acceso;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class AccesoResource extends Resource
{
    protected static ?string $model = Acceso::class;

    protected static ?string $navigationIcon = 'heroicon-m-lock-open';

    protected static ?string $navigationGroup = 'Administración de Clientes';

    protected static ?int $navigationSort = 3;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('cliente_id')
                    ->relationship(name:'cliente', titleAttribute:'empresa')
                    ->required(),
                Forms\Components\TextInput::make('sitio')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('usuario')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('clave')
                    ->password()
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('link')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('observacion')
                    ->required()
                    ->maxLength(255),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('cliente_id')
                    
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('sitio')
                    ->searchable(),
                Tables\Columns\TextColumn::make('usuario')
                    ->searchable(),
                Tables\Columns\TextColumn::make('clave')
                    ->searchable(),
                Tables\Columns\TextColumn::make('link')
                    ->searchable(),
                Tables\Columns\TextColumn::make('observacion')
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
            'index' => Pages\ListAccesos::route('/'),
            'create' => Pages\CreateAcceso::route('/create'),
            'edit' => Pages\EditAcceso::route('/{record}/edit'),
        ];
    }
}
