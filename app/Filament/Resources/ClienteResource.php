<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ClienteResource\Pages;
use App\Filament\Resources\ClienteResource\RelationManagers;
use App\Models\Canton;
use App\Models\Cliente;
use App\Models\Parroquia;
use App\Models\Provincia;
use Doctrine\DBAL\Query;
use Filament\Forms;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Section;
use Filament\Forms\Form;
use Filament\Forms\Get;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Collection;

class ClienteResource extends Resource
{
    protected static ?string $model = Cliente::class;

    protected static ?string $navigationIcon = 'heroicon-o-users';

    protected static ?string $navigationGroup = 'Administración de Clientes';

    protected static ?int $navigationSort = 2;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Datos Personales')
                    ->columns(3)
                    ->schema([
                        Forms\Components\TextInput::make('ruc')
                            ->required()
                            ->label('Cédula/RUC')
                            ->maxLength(13),
                        Forms\Components\Select::make('tipoId')
                            ->relationship(name:'tipos', titleAttribute:'tipo')
                            ->label('Tipo de Contribuyente')
                            ->required(),
                        Forms\Components\TextInput::make('empresa')
                            ->required()
                            ->label('Empresa/Razón Social')
                            ->maxLength(255),
                        Forms\Components\TextInput::make('nombres')
                            ->required()
                            ->maxLength(255),
                        Forms\Components\TextInput::make('apellidos')
                            ->required()
                            ->maxLength(255),
                    ]),

                Section::make('Datos de Contacto')
                    ->columns(3)    
                    ->schema([
                        Forms\Components\TextInput::make('email')
                            ->email()
                            ->prefixIcon('heroicon-m-envelope')
                            ->required()
                            ->maxLength(255),
                        Forms\Components\TextInput::make('telefono')
                            ->tel()
                            ->telRegex('/^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\.\/0-9]*$/')
                            ->prefixIcon('heroicon-m-phone')
                            ->required()
                            ->maxLength(255),
                        Forms\Components\TextInput::make('celular')
                            ->required()
                            ->prefixIcon('heroicon-m-device-phone-mobile')
                            ->maxLength(255),

                    ]),
                
                Section::make('Dirección')
                    ->columns(3)
                    ->schema([
                        Forms\Components\Select::make('provinciaId')
                            ->relationship(name:'provincias', titleAttribute:'provincia')
                            ->required(),
                        Forms\Components\Select::make('cantonId')
                            ->options(fn(Get $get):Collection => Canton::query()
                                ->where('provinciaId',$get('provinciaId'))
                                ->pluck('canton','id'))
                            ->searchable()
                            ->preload()
                            ->live()
                            ->required(),
                            
                        Forms\Components\Select::make('parroquiaId')
                            ->options(fn(Get $get):Collection => Parroquia::query()
                                ->where('cantonId',$get('cantonId'))
                                ->pluck('parroquia','id'))
                            ->searchable()
                            ->preload()
                            ->live()
                            ->required(),
                        Forms\Components\TextInput::make('sectorHogar')
                            ->required()
                            ->maxLength(255),
                        Forms\Components\TextInput::make('sectorNegocio')
                            ->required()
                            ->maxLength(255),
                        Forms\Components\TextInput::make('direccionHogar')
                            ->required()
                            ->maxLength(255),
                        Forms\Components\TextInput::make('direccionNegocio')
                            ->required()
                            ->maxLength(255),
                        Forms\Components\TextInput::make('coordenadasHogar')
                            ->required()
                            ->prefixIcon('heroicon-m-map-pin')
                            ->maxLength(255),
                        Forms\Components\TextInput::make('coordenadasNegocio')
                            ->required()
                            ->prefixIcon('heroicon-m-map-pin')
                            ->maxLength(255),
                        Forms\Components\TextInput::make('imgHogar')
                            ->required()
                            ->visible(false)
                            ->maxLength(255),
                        Forms\Components\TextInput::make('imgNegocio')
                            ->required()
                            ->visible(false)
                            ->maxLength(255),

                        FileUpload::make('imgHogar')
                            ->multiple()
                            ->label('Imagen Hogar')
                            ->previewable(true),
                        
                        FileUpload::make('imgNegocio')
                            ->multiple()
                            ->label('Imagen Negocio')
                            ->previewable(true),

                    ]),

                Section::make('Otros datos')
                    ->columns(3)
                    ->schema([
                        Forms\Components\Select::make('regimenId')
                            ->relationship(name:'regimens', titleAttribute:'regimen')
                            ->required(),
                        Forms\Components\Select::make('declaracionId')
                            ->relationship(name:'declaracions',titleAttribute:'declaracion')
                            ->required(),
                        Forms\Components\Select::make('usuarioId')
                            ->relationship(name:'users', titleAttribute:'name')
                            ->required(),

                    ])
                
                
                
                
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('empresa')
                    ->searchable(),
                Tables\Columns\TextColumn::make('nombres')
                    ->searchable(),
                Tables\Columns\TextColumn::make('apellidos')
                    ->searchable(),
                Tables\Columns\TextColumn::make('email')
                    ->searchable(),
                Tables\Columns\TextColumn::make('telefono')
                    ->searchable(),
                Tables\Columns\TextColumn::make('celular')
                    ->searchable(),
                Tables\Columns\TextColumn::make('provinciaId')
                     ->sortable(),
                Tables\Columns\TextColumn::make('cantonId')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('parroquiaId')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('sectorHogar')
                    ->searchable(),
                Tables\Columns\TextColumn::make('sectorNegocio')
                    ->searchable(),
                Tables\Columns\TextColumn::make('direccionHogar')
                    ->searchable(),
                Tables\Columns\TextColumn::make('direccionNegocio')
                    ->searchable(),
                Tables\Columns\TextColumn::make('coordenadasHogar')
                    ->searchable(),
                Tables\Columns\TextColumn::make('coordenadasNegocio')
                    ->searchable(),
                Tables\Columns\TextColumn::make('imgHogar')
                    ->searchable(),
                Tables\Columns\TextColumn::make('imgNegocio')
                    ->searchable(),
                Tables\Columns\TextColumn::make('tipoId')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('regimenId')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('declaracionId')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('usuarioId')
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
            'index' => Pages\ListClientes::route('/'),
            'create' => Pages\CreateCliente::route('/create'),
            'edit' => Pages\EditCliente::route('/{record}/edit'),
        ];
    }
}
