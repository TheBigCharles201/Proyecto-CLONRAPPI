
const User = require('../modles/user');
const jwt = require('jsonwebtoken');
const keys = require('../config/keys');
const { json } = require('express/lib/response');

module.exports = {
    async getAll(req, res, next) {
        try{
            const data = await User.getAll();
            console.log(`Usuarios: ${data}`);
            return res.status(201).json(data);

        }
        catch(error){
            console.log(`Error: ${error}`);
            return res.status(501).json({
                success: false,
                message: 'Error al obtener los datos de la base'
            });

        }
    },

    async register(req, res, next){
        try{
            const user = req.body;
            const data = await User.create(user);
            return res.status(201).json({
                success: true,
                message: 'Usuario registrado',
                data: data.id
            });

        }
        catch(error){
            console.log(`Error: ${error}`);
            return res.status(501).json({
                success: false,
                message: 'Error al registrar al usuario',
                error: error
            });

        }
    },
    async login(req, res, next){
        try{
            const email = req.body.email;
            const password = req.body.password;
            const myUser = await User.findByEmail(email);
            if(!myUser){
                return res.status(401).json({
                    success: false,
                    message: 'El correo no se encuentra'
                });
            }
            if(User.isPasswordMarched(password, myUser.password)) {
                const token = jwt.sign({id: myUser.id, email: myUser.email}, keys.secretOrKkey, {
                   // expiresIn: (60*60*24) //1 hora
                });
                const data = {
                    id: myUser.id,
                    name: myUser.name,
                    lastname: myUser.lastname,
                    email: myUser.email,
                    phone: myUser.phone,
                    image: myUser.image,
                    session_token: `JWT ${token}`
                }

                return res.status(201).json({
                    success: true,
                    data: data,
                    message: 'El usuario esta autenticado'
                });
            }
            else{
                return res.status(401).json({
                    success: false,
                    message: 'La contraseña es incorrecta'.status,
                });
                
            }

        } catch(error){
            console.log(`Error: ${error}`);
            return res.status(501).json({
                success: false,
                message: 'Error al momento de loguearse',
                error: error
            })

        }
    }


};


//const { getAll } = require('../modles/user');