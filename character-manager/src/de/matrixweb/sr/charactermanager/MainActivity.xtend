package de.matrixweb.sr.charactermanager

import android.app.Activity
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem

public class MainActivity extends Activity {

  protected override void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState)
    setContentView(R.layout.activity_main)

    if (savedInstanceState == null
        && findViewById(R.id.fragment_parent) != null) {
      val clf = new CharacterListFragment()
      clf.arguments = intent.extras
      fragmentManager.beginTransaction().add(R.id.fragment_parent, clf).commit()
    }
  }

  override boolean onCreateOptionsMenu(Menu menu) {
    // Inflate the menu; this adds items to the action bar if it is present.
    menuInflater.inflate(R.menu.main, menu)
    return true
  }

  override boolean onOptionsItemSelected(MenuItem item) {
    switch (item.itemId) {
      case R.id.action_search: {
        return true
      }
    }
    return super.onOptionsItemSelected(item)
  }

}
