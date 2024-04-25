import 'package:flutter/material.dart';
import 'package:escrow_app/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pushNamed(context, '/dashboard'),
        ),
        title: Text(
          'Transactions Screen',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              child: Text(
                'Queue',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Tab(
              child: Text(
                'History',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          QueueTab(),
          HistoryTab(),
        ],
      ),
    );
  }
}

class QueueTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
            child: Text(
              "Approvals pending",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              IconData iconData;
              Color color;
              String subText;
              if (index % 2 == 0) {
                iconData = Icons.arrow_downward_sharp;
                color = Colors.green;
                subText = 'Successful';
              } else {
                iconData = Icons.arrow_upward_sharp;
                color = Colors.red;
                subText = 'Approval required';
              }
              return InkWell(
                onTap: () {},
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
        ],
      ),
    );
  }
}

class HistoryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              IconData iconData;
              Color color;
              String subText;
              if (index % 2 == 0) {
                iconData = Icons.arrow_downward_sharp;
                color = Colors.green;
                subText = 'John doe';
              } else {
                iconData = Icons.arrow_upward_sharp;
                color = Colors.red;
                subText = 'John doe';
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
        ],
      ),
    );
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
}
