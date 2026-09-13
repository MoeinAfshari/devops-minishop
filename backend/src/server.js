const express = require("express");

const app = express();

app.get("/", (req, res) => {
	res.send("MiniShop Backend");
});

app.get("/health", (req, res) => {
	res.status(200).json({
		status: "ok"
	});
});

app.listen(3000, "0.0.0.0", () => {
	console.log("Server running on port 3000");
});
