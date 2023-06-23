let express = require('express');
let bodyParser = require('body-parser');
let cors = require('cors');

let mysql = require('mysql2');

let app = express()
    .use(cors({ credentials: true, origin: 'http://localhost:4200' }))
    .use(bodyParser.json())
    .use(bodyParser.urlencoded({ extended: true }));

app.listen(10101, () => {
    console.log("Conexión establecida en el puerto 10101");
});

/******************************************************************/

let conexion = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '1234',
    database: 'db_proyecto'
});

conexion.connect((error) => {
    if (error) {
        console.error("Error al conectar con la db", error);
    }

    console.log("Conexión establecida con la base de datos");
});

/******************************************************************/

// app.post('/register', function (req, res) {
//     let name = req.body.name;
//     let lastname = req.body.lastname;
//     let email = req.body.email;
//     console.log(name, lastname, email, req.header("Authorization"));
//     return res.status(200).json({ "Status": "ok registrado con json" });
// });

app.post('/register', function (req, res) {
    let name = req.body.name;
    let password = req.body.password;
    let email = req.body.email;

    console.log(name, password, email, req.header("Authorization"));

    conexion.query("INSERT INTO usuario (name, passw, email) VALUES (?,?,?)", [name, password, email], (error) => {
        if (error) {
            console.error(error);
            return res.status(500).json({ "Status": "Error al registrar" });
        }

        return res.status(200).json({ "Status": "Registrado con éxito" });
    });
});

// app.post('/register', function (req, res) {
//     let name = req.body.name;
//     let password = req.body.password;
//     let email = req.body.email;
//     conexion.query("SELECT * FROM usuario WHERE email = ?", [email], (error, respuesta) => {
//         if (error) {
//             console.error(error);
//             return res.status(500).json({ "Status": "Error al registrar" });
//         }

//         if (respuesta[0] === 0) {
//             conexion.query("INSERT INTO usuario (name, passw, email) VALUES (?,?,?)", [name, password, email], (errorInsert, respuestaInsert))
//             if (error) {
//                 console.error(error);
//                 return res.status(500).json({ "Status": "Error al registrar" });
//             }
//         } else {
//             return res.status(409).json({ "Status": "El email ingresado ya está en uso" });
//         }

//         return res.status(200).json({ "Status": "Registrado con éxito" });

//     });
// });

// app.post('/login', function (req, res) {
//     let email = req.body.email;
//     let password = req.body.password;

//     if (email === 'test@gmail.com' && password === '1234') {
//         return res.status(200).json({ "Status": "Ok inicio de sesión" });
//     } else {
//         return res.status(401).json({ error: 'Credenciales inválidas' });
//     }
// });

app.post('/login', function (req, res) {
    let email = req.body.email;
    let password = req.body.password;

    console.log(email, password);

    conexion.query("SELECT passw, name FROM usuario WHERE email = ?", [email], (error, results) => {
        if (error) {
            console.error(error);
            return res.status(500).json({ "Status": "Error al iniciar sesión" });
        }

        console.log(results.length);

        if (results.length === 0) {
            return res.status(401).json({ "Status": "Credenciales incorrectas" });
        }

        const storedPassword = results[0].passw;
        const name = results[0].name;

        if (password === storedPassword) {
            return res.status(200).json({ "Status": "Inicio de sesión exitoso", "Nombre": name });
        } else {
            return res.status(401).json({ "Status": "Credenciales incorrectas" });
        }
    });
});

// app.get("/productos", (req, res) => {
//     return res.status(200).json({
//         prendas: [
//             // { nombre: "", precio: "", url: "" },
//             { nombre: "Pantalon", precio: "20000", url: "https://www.pngmart.com/files/6/Trousers-PNG-Transparent-Image.png" },
//             { nombre: "Gorra", precio: "15000", url: "https://static.vecteezy.com/system/resources/previews/008/847/346/original/isolated-black-cap-front-view-free-png.png" },
//             // { nombre: "Camiseta", precio: "50000", url: "https://assets.stickpng.com/images/580b57fbd9996e24bc43bf78.png" },
//             { nombre: "Camiseta", precio: "15000", url: "https://upload.wikimedia.org/wikipedia/commons/6/60/CamisetaRojaTrans.png" },
//             { nombre: "Bermuda", precio: "10000", url: "https://cdn.coordiutil.com/imagen-bermuda_tipo_cargo_en_dril_regular_fit_five_forty-2315193-0-0-0-100.jpg" },
//             { nombre: "Sudadera", precio: "20000", url: "https://www.playerasmark.com/app/assets/media/2017/10/sudadera.png" },
//             { nombre: "Camiseta", precio: "15000", url: "https://upload.wikimedia.org/wikipedia/commons/6/60/CamisetaRojaTrans.png" },
//             { nombre: "Zapatos", precio: "3000", url: "https://static.vecteezy.com/system/resources/thumbnails/009/664/903/small/3d-render-sport-shoes-illustration-png.png" },
//             { nombre: "Camisa", precio: "15000", url: "https://png.pngtree.com/png-clipart/20211116/original/pngtree-mens-shirts-clothes-cotton-fabrics-warm-wearing-brand-png-image_6933128.png" },
//             { nombre: "Chaqueta", precio: "40000", url: "https://www.pngplay.com/wp-content/uploads/4/Leather-Jacket-PNG-Images-HD.png" },
//             { nombre: "Pantalon", precio: "20000", url: "https://www.pngmart.com/files/6/Trousers-PNG-Transparent-Image.png" },
//         ]
//     })
// })

app.get("/productos", (req, res) => {

    conexion.query('SELECT name, url FROM prendas', (error, resultado) => {
        if (error) {
            console.error(error);
            return res.status(500).json({ error: 'Error en el servidor' });
        }

        let prendas = resultado.map(row => ({
            name: row.name,
            price: row.price,
            url: row.url

        }))

        return res.status(200).json({ prendas: prendas });
    })
})