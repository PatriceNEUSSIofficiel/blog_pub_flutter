import 'package:flutter/material.dart';
import 'article_page.dart';

class AccueilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final articlesPage = ArticlesPage();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Nom du Blog'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.facebook),
            onPressed: () {
              // Action à effectuer lors du clic sur le bouton Facebook
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 4.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bienvenue sur le Blog',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Présentation de la publicité sponsorisée',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Card(
                elevation: 4.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Derniers articles',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      // ListView.builder(
                      //   shrinkWrap: true,
                      //   physics: NeverScrollableScrollPhysics(),
                      //   itemCount: articlesPage.articles.length,
                      //   itemBuilder: (context, index) {
                      //     final article = articlesPage.articles[index];
                      //     return GestureDetector(
                      //       onTap: () {
                      //         // Action à effectuer lorsque l'utilisateur clique sur l'article
                      //       },
                      //       child: ListTile(
                      //         leading: Hero(
                      //           tag: article.imageUrl,
                      //           child: CircleAvatar(
                      //             backgroundImage: AssetImage(article.imageUrl),
                      //           ),
                      //         ),
                      //         title: Text(article.title),
                      //         subtitle: Text(article.author),
                      //         trailing: Icon(Icons.arrow_forward),
                      //       ),
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Card(
                elevation: 4.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Inscrivez-vous pour rester informé',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Votre adresse e-mail',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.mail),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      ElevatedButton(
                        onPressed: () {
                          // Action lorsque le bouton est pressé
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.person_add),
                            SizedBox(width: 8.0),
                            Text('S\'inscrire'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/accueil');
              break;
            case 1:
              Navigator.pushNamed(context, '/articles');
              break;
            case 2:
              Navigator.pushNamed(context, '/a_propos');
              break;
            case 3:
              Navigator.pushNamed(context, '/contact');
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Articles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'À propos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}
