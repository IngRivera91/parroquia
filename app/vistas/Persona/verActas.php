<?php

/** @var \App\Controllers\PersonaController $controlador */

$persona = $controlador->persona;

$nombreCompleto = trim(
    ($persona['name'] ?? '') . ' ' .
    ($persona['apellido_paterno'] ?? '') . ' ' .
    ($persona['apellido_materno'] ?? '')
);

?>

<br>
<br>

<main class="main section-color-primary">

    <div class="container actas-persona">

        <!-- Datos de la persona -->
        <div class="card card-outline mb-4">

            <div class="card-header">

                <h3 class="card-title">

                    <i class="fas fa-user mr-2"></i>

                    Datos de la persona

                </h3>

            </div>


            <div class="card-body">

                <div class="row">

                    <div class="col-md-6">

                        <strong>Nombre completo</strong>

                        <p class="text-muted mb-0">
                            <?= htmlspecialchars($nombreCompleto) ?>
                        </p>

                    </div>


                    <div class="col-md-3">

                        <strong>Fecha de nacimiento</strong>

                        <p class="text-muted mb-0">

                            <?= htmlspecialchars(
                                $persona['fecha_nacimiento'] ?? 'No registrada'
                            ) ?>

                        </p>

                    </div>

                </div>

            </div>

        </div>


        <!-- Actas -->
        <div class="card card-outline">

            <div class="card-header">

                <h3 class="card-title">

                    <i class="fas fa-book mr-2"></i>

                    Actas registradas

                </h3>

            </div>


            <div class="card-body p-0">

                <?php if (!empty($persona['actas_personas'])): ?>

                    <div class="table-responsive">

                        <table class="table table-hover mb-0">

                            <thead>

                            <tr>

                                <th>Tipo de acta</th>
                                <th>Libro</th>
                                <th>Hoja</th>
                                <th>Acta</th>
                                <th>Fecha</th>
                                <th>Rol</th>

                            </tr>

                            </thead>


                            <tbody>

                            <?php foreach ($persona['actas_personas'] as $actaPersona): ?>

                                <?php

                                $acta = $actaPersona['acta'] ?? [];
                                $libro = $acta['libro'] ?? [];
                                $tipoActa = $libro['tipo_acta'] ?? [];
                                $rol = $actaPersona['rol'] ?? [];

                                ?>

                                <tr>

                                    <td>

                                        <span class="badge badge-tipo">

                                            <?= htmlspecialchars(
                                                $tipoActa['label'] ?? 'Sin tipo'
                                            ) ?>

                                        </span>

                                    </td>


                                    <td>

                                        <?= htmlspecialchars(
                                            $libro['description_select'] ?? 'Sin libro'
                                        ) ?>

                                    </td>


                                    <td>

                                        <strong>

                                            <?= htmlspecialchars(
                                            $acta['numero_hoja'] ?? ''
                                            ) ?>

                                        </strong>

                                    </td>


                                    <td>

                                        <?= htmlspecialchars(
                                            $acta['numero_acta'] ?? ''
                                        ) ?>

                                    </td>


                                    <td>

                                        <?= htmlspecialchars(
                                            $acta['fecha'] ?? ''
                                        ) ?>

                                    </td>


                                    <td>

                                        <span class="badge badge-rol">

                                            <?= htmlspecialchars(
                                                $rol['label'] ?? 'Sin rol'
                                            ) ?>

                                        </span>

                                    </td>

                                </tr>

                            <?php endforeach; ?>

                            </tbody>

                        </table>

                    </div>

                <?php else: ?>

                    <div class="text-center py-5">

                        <i class="fas fa-folder-open fa-3x mb-3"
                           style="color: var(--color-principal);"></i>

                        <h5>
                            No hay actas registradas
                        </h5>

                        <p class="text-muted mb-0">
                            Esta persona todavía no tiene actas asociadas.
                        </p>

                    </div>

                <?php endif; ?>

            </div>

        </div>


        <!-- Regresar -->
        <div class="row mb-4">

            <div class="col-md-12 text-md-right mt-3">

                <a href="index.php?controlador=Persona&metodo=lista&session_id=<?= SESSION_ID ?>"
                   class="btn btn-regresar">

                    <i class="fas fa-arrow-left mr-1"></i>

                    Regresar a personas

                </a>

            </div>

        </div>

    </div>

</main>
