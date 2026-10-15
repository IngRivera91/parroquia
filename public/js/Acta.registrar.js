document.addEventListener('DOMContentLoaded', function () {

    /*
     * =========================================
     * ELEMENTOS
     * =========================================
     */

    const tipoActa = document.getElementById('tipo_acta_id');
    const libro = document.getElementById('libro_id');
    const titular2 = document.getElementById('acta-titular-2');

    const sessionId = document.getElementById('session_id').value;


    /*
     * =========================================
     * CAMBIO DE TIPO DE ACTA
     * =========================================
     */

    tipoActa.addEventListener('change', function () {

        const tipoActaId = this.value;


        /*
         * =========================================
         * LIMPIAR LIBROS
         * =========================================
         */

        libro.innerHTML = '';

        const opcionInicial = document.createElement('option');

        opcionInicial.value = '';
        opcionInicial.textContent = 'Seleccione un libro';

        libro.appendChild(opcionInicial);

        libro.disabled = true;


        /*
         * =========================================
         * OCULTAR TITULAR 2
         * =========================================
         */

        titular2.style.display = 'none';


        /*
         * =========================================
         * SI NO HAY TIPO DE ACTA
         * =========================================
         */

        if (!tipoActaId) {
            return;
        }


        /*
         * =========================================
         * OBTENER NÚMERO DE TITULARES
         * =========================================
         */

        const urlTitulares =
            'index.php?controlador=TipoActa&metodo=getNumeroTitulares&session_id='
            + sessionId;


        fetch(urlTitulares, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'tipo_acta_id=' + encodeURIComponent(tipoActaId)
        })
            .then(function (response) {

                if (!response.ok) {
                    throw new Error('Error al obtener el número de titulares');
                }

                return response.json();

            })
            .then(function (data) {

                if (!data.success) {
                    throw new Error(
                        data.message || 'No se pudo obtener el número de titulares'
                    );
                }


                /*
                 * =========================================
                 * MOSTRAR / OCULTAR TITULAR 2
                 * =========================================
                 */

                if (data.numero_titulares >= 2) {

                    titular2.style.display = '';

                } else {

                    titular2.style.display = 'none';

                }

            })
            .catch(function (error) {

                console.error('Error:', error);

                titular2.style.display = 'none';

            });


        /*
         * =========================================
         * OBTENER LIBROS
         * =========================================
         */

        const urlLibros =
            'index.php?controlador=TipoActa&metodo=getLibrosByTipoActa&session_id='
            + sessionId;


        fetch(urlLibros, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'tipo_acta_id=' + encodeURIComponent(tipoActaId)
        })
            .then(function (response) {

                if (!response.ok) {
                    throw new Error('Error al obtener los libros');
                }

                return response.json();

            })
            .then(function (data) {

                if (!data.success) {
                    throw new Error(
                        data.message || 'No se pudieron obtener los libros'
                    );
                }


                /*
                 * =========================================
                 * LLENAR SELECT DE LIBROS
                 * =========================================
                 */

                data.libros.forEach(function (libroData) {

                    const option = document.createElement('option');

                    option.value = libroData.id;
                    option.textContent = libroData.description_select;

                    libro.appendChild(option);

                });


                /*
                 * =========================================
                 * ACTIVAR SELECT
                 * =========================================
                 */

                if (data.libros.length > 0) {
                    libro.disabled = false;
                }

            })
            .catch(function (error) {

                console.error('Error:', error);

                libro.innerHTML = '';

                const option = document.createElement('option');

                option.value = '';
                option.textContent = 'No hay libros disponibles';

                libro.appendChild(option);

                libro.disabled = true;

            });

    });

});