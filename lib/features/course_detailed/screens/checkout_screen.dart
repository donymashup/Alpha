import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  final String courseName;
  final String duration;
  final String fee; 
  final String image;

  const CheckoutScreen({
    required this.courseName,
    required this.duration,
    required this.fee,
    required this.image,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Checkout', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black), iconSize: 16,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Course Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                Card(
                  color: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Color.fromARGB(255, 173, 173, 173), width: 2), // Red border added
                  ),
                  shadowColor: Colors.grey.shade100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Image.network(
                          image,
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text(courseName,
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                                const SizedBox(height: 8),
                                Text('Duration: $duration Days',
                                    style: const TextStyle(fontSize: 15)),      
                              ],
                            ),
                            Text('Fee: ₹$fee', style: const TextStyle(fontSize: 15)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
          
                const Text(
                  'Referral Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Referrer Name (Optional)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Referrer Phone Number (Optional)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
          
                const Text(
                  'Promo Code',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Promo Code',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.discount, color: Colors.redAccent),
                  ),
                ),
                const SizedBox(height: 20),
          
                // const Text(
                //   'Payment Method',
                //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                // ),
                // const SizedBox(height: 10),
                // Row(
                //   children: [
                //     Expanded(
                //       child: ElevatedButton.icon(
                //         onPressed: () {}, 
                //         icon: const Icon(Icons.credit_card, color: Colors.white),
                //         label: const Text("Credit/Debit Card"),
                //         style: ElevatedButton.styleFrom(
                //           backgroundColor: Colors.white,
                //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                //         ),
                //       ),
                //     ),
                //     const SizedBox(width: 10),
                //     Expanded(
                //       child: ElevatedButton.icon(
                //         onPressed: () {}, 
                //         icon: const Icon(Icons.account_balance_wallet, color: Colors.white),
                //         label: const Text("UPI/Wallet"),
                //         style: ElevatedButton.styleFrom(
                //           backgroundColor: Colors.redAccent,
                //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(height: 20),
          
                // const Text(
                //   'Total Amount',
                //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                // ),
                // const SizedBox(height: 5),
                // Text(
                //   '₹$fee',
                //   style: const TextStyle(
                //     fontSize: 24,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.redAccent,
                //   ),
                // ),
          
                // const SizedBox(height: 20),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                      activeColor: Colors.redAccent,
                    ),
                    const Expanded(
                      child: Text(
                        'I agree to the Terms & Conditions',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle checkout logic
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text('Proceed to Payment',
              style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
