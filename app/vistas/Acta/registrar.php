<?php

use App\Class\Redireccion;

?>

<br>
<input
        type="hidden"
        id="session_id"
        value="<?php echo $_GET['session_id']; ?>"
>
<form
        autocomplete="off"
        role="form"
        method="POST"
        action="<?php echo Redireccion::obtener(
                $controlador->nameController,
                'registrarBd',
                SESSION_ID
        ) ?>"
>

    <!-- INFORMACIÓN DEL ACTA -->
    <div class="acta-info">

        <div class="row">

            <!-- Tipo de acta -->
            <div class="col-md-6">
                <div class="form-group">

                    <label for="tipo_acta_id">
                        Tipo de acta
                    </label>

                    <select
                            id="tipo_acta_id"
                            name="tipo_acta_id"
                            class="form-control"
                            required
                    >
                        <option value="">
                            Seleccione un tipo de acta
                        </option>

                        <?php foreach ($controlador->tiposActa as $tipoActa): ?>

                            <option value="<?php echo $tipoActa['id']; ?>">
                                <?php echo $tipoActa['label']; ?>
                            </option>

                        <?php endforeach; ?>

                    </select>

                </div>
            </div>

            <!-- Libro -->
            <div class="col-md-6">
                <div class="form-group">

                    <label for="libro_id">
                        Libro
                    </label>

                    <select
                            id="libro_id"
                            name="libro_id"
                            class="form-control"
                            required
                            disabled
                    >
                        <option value="">
                            Seleccione un libro
                        </option>
                    </select>

                </div>
            </div>

            <!-- Número de hoja -->
            <div class="col-md-4">
                <div class="form-group">

                    <label for="numero_hoja">
                        Número de hoja
                    </label>

                    <input
                            type="number"
                            id="numero_hoja"
                            name="numero_hoja"
                            class="form-control"
                            min="1"
                            required
                    >

                </div>
            </div>

            <!-- Número de acta -->
            <div class="col-md-4">
                <div class="form-group">

                    <label for="numero_acta">
                        Número de acta
                    </label>

                    <input
                            type="number"
                            id="numero_acta"
                            name="numero_acta"
                            class="form-control"
                            min="1"
                            required
                    >

                </div>
            </div>

            <!-- Fecha -->
            <div class="col-md-4">
                <div class="form-group">

                    <label for="fecha">
                        Fecha
                    </label>

                    <input
                            type="date"
                            id="fecha"
                            name="fecha"
                            class="form-control"
                    >

                </div>
            </div>

            <!-- Observaciones -->
<!--            <div class="col-md-12">-->
<!--                <div class="form-group">-->
<!---->
<!--                    <label for="observaciones">-->
<!--                        Observaciones-->
<!--                    </label>-->
<!---->
<!--                    <textarea-->
<!--                            id="observaciones"-->
<!--                            name="observaciones"-->
<!--                            class="form-control"-->
<!--                            rows="1"-->
<!--                    ></textarea>-->
<!---->
<!--                </div>-->
<!--            </div>-->

        </div>

    </div>

    <!-- TITULAR 1 -->
    <div class="acta-titular">

        <div class="row">

            <!-- Nombre -->
            <div class="col-md-3">
                <div class="form-group">

                    <label for="titular_1_name">
                        Nombre
                    </label>

                    <input
                            type="text"
                            id="titular_1_name"
                            name="titular_1_name"
                            class="form-control"
                            required
                    >

                </div>
            </div>

            <!-- Apellido paterno -->
            <div class="col-md-3">
                <div class="form-group">

                    <label for="titular_1_apellido_paterno">
                        Apellido paterno
                    </label>

                    <input
                            type="text"
                            id="titular_1_apellido_paterno"
                            name="titular_1_apellido_paterno"
                            class="form-control"
                            required
                    >

                </div>
            </div>

            <!-- Apellido materno -->
            <div class="col-md-3">
                <div class="form-group">

                    <label for="titular_1_apellido_materno">
                        Apellido materno
                    </label>

                    <input
                            type="text"
                            id="titular_1_apellido_materno"
                            name="titular_1_apellido_materno"
                            class="form-control"
                    >

                </div>
            </div>

            <!-- Fecha de nacimiento -->
            <div class="col-md-3">
                <div class="form-group">

                    <label for="titular_1_fecha_nacimiento">
                        Fecha de nacimiento
                    </label>

                    <input
                            type="date"
                            id="titular_1_fecha_nacimiento"
                            name="titular_1_fecha_nacimiento"
                            class="form-control"
                    >

                </div>
            </div>

        </div>

    </div>

    <!-- TITULAR 2 -->
    <div
            id="acta-titular-2"
            class="acta-titular"
            style="display: none;"
    >

        <div class="row">

            <!-- Nombre -->
            <div class="col-md-3">
                <div class="form-group">

                    <label for="titular_2_name">
                        Nombre
                    </label>

                    <input
                            type="text"
                            id="titular_2_name"
                            name="titular_2_name"
                            class="form-control"
                    >

                </div>
            </div>

            <!-- Apellido paterno -->
            <div class="col-md-3">
                <div class="form-group">

                    <label for="titular_2_apellido_paterno">
                        Apellido paterno
                    </label>

                    <input
                            type="text"
                            id="titular_2_apellido_paterno"
                            name="titular_2_apellido_paterno"
                            class="form-control"
                    >

                </div>
            </div>

            <!-- Apellido materno -->
            <div class="col-md-3">
                <div class="form-group">

                    <label for="titular_2_apellido_materno">
                        Apellido materno
                    </label>

                    <input
                            type="text"
                            id="titular_2_apellido_materno"
                            name="titular_2_apellido_materno"
                            class="form-control"
                    >

                </div>
            </div>

            <!-- Fecha de nacimiento -->
            <div class="col-md-3">
                <div class="form-group">

                    <label for="titular_2_fecha_nacimiento">
                        Fecha de nacimiento
                    </label>

                    <input
                            type="date"
                            id="titular_2_fecha_nacimiento"
                            name="titular_2_fecha_nacimiento"
                            class="form-control"
                    >

                </div>
            </div>

        </div>

    </div>

    <!-- BOTÓN GUARDAR -->
    <div class="row">
        <div class="col-md-12">
            <div class="form-group">
                <button
                        type="submit"
                        name="<?php echo $controlador->llave; ?>"
                        class="btn btn-primary"
                >
                    Registrar acta
                </button>
            </div>
        </div>
    </div>

</form>