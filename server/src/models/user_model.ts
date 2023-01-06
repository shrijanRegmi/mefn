import { model, Schema } from "mongoose";

const userSchema = new Schema({
  email: {
    type: String,
    required: true,
    trim: true,
    validate: {
      validator: (value: any) => {
        const regex = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$";
        return value.match(regex);
      },
      message: "Please enter a valid email address",
    }
  },
  password: {
    type: String,
    required: true,
    trim: true,
  }
});

const User = model("User", userSchema);
export default User;