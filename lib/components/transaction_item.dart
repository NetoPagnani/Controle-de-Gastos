import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.tr,
    required this.delete,
  }) : super(key: key);

  final Transaction tr;
  final void Function(String p1) delete;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Color.fromARGB(255, 239, 5, 5),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                ('R\$${tr.value}'),
                style: TextStyle(
                  color: Color.fromARGB(255, 238, 246, 5),
                  fontFamily: 'ComicNeue',
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          tr.title,
          style: TextStyle(
            color: Color.fromARGB(255, 7, 2, 95),
            fontFamily: 'ComicNeue',
            fontSize: 22,
          ),
        ),
        subtitle: Text(
          DateFormat('d / MMM / y').format(tr.date),
          style: TextStyle(
            color: Color.fromARGB(255, 188, 7, 219),
            fontSize: 12,
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 480
            ? FlatButton.icon(
                onPressed: () => delete(tr.id),
                icon: Icon(Icons.delete),
                color: Color.fromARGB(150, 249, 170, 1),
                label: Text('Excluir'),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Color.fromARGB(141, 243, 166, 0),
                onPressed: () => delete(tr.id),
              ),
      ),
    );
  }
}
