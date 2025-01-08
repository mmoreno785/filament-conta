<?php

namespace App\Filament\Resources;

use App\Filament\Resources\TramiteResource\Pages;
use App\Filament\Resources\TramiteResource\RelationManagers;
use App\Models\Cliente;
use App\Models\Tramite;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class TramiteResource extends Resource
{
    protected static ?string $model = Tramite::class;

    protected static ?string $navigationIcon = 'heroicon-s-folder-minus';

    protected static ?string $navigationLabel = 'Trámites';

    protected static ?string $navigationGroup = 'Administración de Trámites';

    protected static ?int $navigationSort = 3;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('cliente_id')
                    ->relationship(name:'cliente', titleAttribute:'empresa')
                    ->preload()
                    //->options(Cliente::all()->pluck('nombres'.''.'apellidos','id'))
                    ->searchable()
                    ->required(),
                Forms\Components\TextInput::make('usuario_id')
                    ->required()
                    ->numeric(),
                Forms\Components\DatePicker::make('fecha')
                    ->default(now())
                    ->required(),
                Forms\Components\Select::make('catalogo_id')
                    ->relationship(name:'catalogo', titleAttribute:'descripcion')
                    ->searchable()
                    ->preload()
                    ->required(),
                Forms\Components\TextInput::make('cantidad')
                    ->required()
                    ->default(1)
                    ->numeric(),
                Forms\Components\TextInput::make('unitario')
                    ->required()
                    ->numeric(),
                Forms\Components\TextInput::make('total')
                    ->required()
                    ->numeric(),
                Forms\Components\TextInput::make('observacion')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('estado')
                    ->required()
                    ->numeric(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('cliente.empresa')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('usuario_id')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('fecha')
                    ->date()
                    ->sortable(),
                Tables\Columns\TextColumn::make('catalogo.descripcion')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('cantidad')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('unitario')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('total')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('observacion')
                    ->searchable(),
                Tables\Columns\TextColumn::make('estado')
                    ->numeric()
                    ->sortable(),
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
            'index' => Pages\ListTramites::route('/'),
            'create' => Pages\CreateTramite::route('/create'),
            'edit' => Pages\EditTramite::route('/{record}/edit'),
        ];
    }
}
