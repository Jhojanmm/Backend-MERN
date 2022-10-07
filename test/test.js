import { expect } from 'chai';
import Usuario from "../models/Usuario.js";


describe('Validating email', async () => {
    it('should return that email already exists', async () => {
        const user = {     "nombre": "Juan",     "password": "password",     "email": "juan@juan" }
        const email = "juan@juan";
        const verificar = await Usuario.findOne({ email })
        console.log(verificar);
        const result = true;
        expect(verificar).to.equals(result);

    });

})


describe('Validating email', () => {
    it('should return that email is valid', () => {
        const correo = "jhojan04@gmail.com";
        let verify = false;
        if (correo.includes("@")){
            verify = true;
        }
        const result = true;
        expect(verify).to.equals(result);
    })
})

describe('Validating email', () => {
    it('should return that email needs to be valid', () => {
        const correo = "jhojan04gmail.com";
        let verify = false;
        if (correo.includes("@")){
            verify = true;
        }
        const result = false;
        expect(verify).to.equals(result);
    })
})