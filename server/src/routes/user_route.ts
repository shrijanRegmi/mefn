import { Router } from "express";
import authenticator from "../middlewares/authenticator_middleware";
import User from "../models/user_model";

const userRouter = Router();

userRouter.get("/", authenticator, async (req, res) => {
  try {
    const { uid } = req.body;
    const user = await User.findById(uid);

    if (!user) {
      return res.status(404).json({
        msg: "User not found",
      });
    }

    return res.status(200).json({
      ...user,
    });
  } catch (e) {
    return res.status(e.status || 500).json({
      error: e.message,
    });
  }
})

export default userRouter;