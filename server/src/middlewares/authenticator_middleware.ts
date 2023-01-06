import { NextFunction, Request, Response } from "express";
import jwt from "jsonwebtoken";

const authenticator = (req: Request, res: Response, next: NextFunction) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) {
      return res.status(401).json({
        msg: "No auth token, authorization denied."
      });
    }

    const isVerified = jwt.verify(token, "passwordKey");
    if (!isVerified) {
      return res.status(401).json({
        msg: "Token verification failed, authorization denied."
      });
    }

    next();
  } catch (e) {
    return res.status(e.status || 500).json({
      error: e.message,
    });
  }
}

export default authenticator;