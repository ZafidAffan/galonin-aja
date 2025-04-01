const express = require("express");
const midtransClient = require("midtrans-client");

const app = express();
app.use(express.json());

const snap = new midtransClient.Snap({
  isProduction: false, // Ubah ke true jika menggunakan mode produksi
  serverKey: 'YOUR_SERVER_KEY',
});

app.post("/create-transaction", async (req, res) => {
    const { orderId, grossAmount } = req.body; // Ambil order ID dan jumlah transaksi dari frontend
  
    // Definisikan transaksi
    const transactionDetails = {
      order_id: orderId,
      gross_amount: grossAmount,
    };
  
    const itemDetails = [
      {
        id: "item1",
        price: grossAmount,
        quantity: 1,
        name: "Service Order",
      }
    ];
  
    const customerDetails = {
      first_name: "John",
      last_name: "Doe",
      email: "johndoe@example.com",
      phone: "+6281234567890",
    };
  
    const request = {
      transaction_details: transactionDetails,
      item_details: itemDetails,
      customer_details: customerDetails,
    };
  
    try {
      const transaction = await snap.createTransaction(request);
      res.status(200).send(transaction); // Kirimkan snap_token ke frontend
    } catch (error) {
      res.status(500).send(error);
    }
  });
  
  const port = 3000;
  app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
  });
  