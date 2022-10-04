import express from "express";
import { registrar } from "../controllers/usuariosController.js";

const router = express.Router();

//Autenticación, Registro y Confirmación de Usuario

router.post("/", registrar); //Crea un nuevo usuario

export default router;
