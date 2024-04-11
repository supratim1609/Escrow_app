import 'package:flutter/material.dart';
import 'package:escrow_app/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  void initState() {
    super.initState();
    // Set up listener for back button press
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // Override the back button behavior
      WillPopScope(
        onWillPop: () async {
          // Navigate back to the HomeScreen
          Navigator.pushNamed(context, RouteNames.dashboard);
          return true; // Return true to allow pop operation
        },
        child: Container(),
      );
    });
  }

  void _showTransactionDetails(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Transaction Details',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'To : John doe',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'From : John doe',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'From Escrow Id: 12****C',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'To Escrow Id: 12****C',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Date : 10-04-2024',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Amount: \$50.00', // Sample amount, you can customize this
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle first button press
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.copy),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle second button press
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.share_sharp),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transactions Screen',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
              child: Text(
                "Transaction History",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  IconData iconData;
                  Color color;
                  String subText;
                  if (index % 2 == 0) {
                    iconData = Icons.arrow_downward_sharp; // Different icon for even indices
                    color = Colors.green; // Different color for even indices
                    subText = 'John doe'; // Subtext for even indices
                  } else {
                    iconData = Icons.arrow_upward_sharp; // Different icon for odd indices
                    color = Colors.red; // Different color for odd indices
                    subText = 'John doe'; // Subtext for odd indices
                  }
                  return InkWell(
                    onTap: () {
                      // Open modal bottom sheet with transaction details
                      _showTransactionDetails(context, index);
                    },
                    child: ListTile(
                      leading: Icon(
                        iconData,
                        color: color,
                      ),
                      title: Text(
                        "Transaction $index",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        subText,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      trailing: Text(
                        "\$50.00", // Sample amount, you can customize this
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
