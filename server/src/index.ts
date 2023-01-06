import express from 'express';
import authRouter from './routes/auth_route';
import mongoose from 'mongoose';
import dotenv from "dotenv";
import userRouter from './routes/user_route';

const app = express();
dotenv.config();

app.use(express.json());
app.use("/auth", authRouter);
app.use("/user", userRouter);

mongoose.connect(process.env.MONGO_CONNECTION_URL).then(() => {
  console.log('Success: Connecting to mongoDB');
}).catch((e) => {
  console.log('Error!!!: Connecting to mongoDB', e);
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Started listening to port - ${PORT}`);
});