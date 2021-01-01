import * as dotenv from "dotenv";

import express, { Application, Request, Response } from "express";

dotenv.config();

const app: Application = express();

app.get("/", (req: Request, res: Response) =>
  res.json({ response: "hello world" })
);

app.listen(process.env.PORT || 3888, () => {
  console.log(`server is listening on ${process.env.PORT}`);
});
