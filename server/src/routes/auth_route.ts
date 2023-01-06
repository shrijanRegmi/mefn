import { Router } from "express";
import bcrypt from 'bcryptjs';
import User from "../models/user_model";
import jwt from "jsonwebtoken";

const authRouter = Router();

authRouter.post("/signup", async (req, res) => {
  try {
    const { email, password } = req.body;

    let user = await User.findOne({ email });

    if (user) {
      return res.status(400).json({
        msg: "User with same credential already exists. Please login with the credential instead.",
      });
    }

    const hashedPassword = await bcrypt.hash(password, 8);
    user = new User({
      email,
      password: hashedPassword,
    });

    user = await user.save();

    const token = jwt.sign({ id: user._id }, "passwordKey");

    return res.status(200).json({
      token,
      ...user
    });
  } catch (e) {
    return res.status(e.status || 500).json({
      error: e.message,
    });
  }
});

authRouter.post("/login", async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email });

    if (!user) {
      return res.status(400).json({
        msg: "User with the credential doesn't exist. Please signup with the credential instead.",
      });
    }

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({
        msg: "Incorrect password",
      })
    }

    const token = jwt.sign({ id: user._id }, "passwordKey");

    return res.status(200).json({
      token,
      ...user,
    });
  } catch (e) {
    return res.status(e.status || 500).json({
      error: e.message,
    });
  }
});

export default authRouter;