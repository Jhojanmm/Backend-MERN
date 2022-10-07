import express from "express";
import {
  registrar,
  autenticar,
  confirmar,
  olvidePassword,
  comprobarToken,
} from "../controllers/usuariosController.js";

const router = express.Router();

//Autenticación, Registro y Confirmación de Usuario

router.post("/", registrar); //Crea un nuevo usuario
router.post("/login", autenticar);
router.get("/confirmar/:token", confirmar);
router.post("/olvide-password", olvidePassword);
router.get("/olvide-password/:token", comprobarToken);

export default router;
