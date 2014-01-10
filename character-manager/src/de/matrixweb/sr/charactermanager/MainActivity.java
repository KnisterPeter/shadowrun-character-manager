package de.matrixweb.sr.charactermanager;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import de.matrixweb.sr.lib.Character;

public class MainActivity extends Activity {

  public final static String EXTRA_MESSAGE = "de.matrixweb.sr.charactermanager.MESSAGE";

  private Character character;

  @Override
  protected void onCreate(final Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);

    this.character = new Character();
    this.character.setName("Yada-Yada");

    ((EditText) findViewById(R.id.edit_message)).setText(this.character
        .getName());

    if (savedInstanceState == null
        && findViewById(R.id.fragment_parent) != null) {
      final CharacterListFragment clf = new CharacterListFragment();
      clf.setArguments(getIntent().getExtras());
      getFragmentManager().beginTransaction().add(R.id.fragment_parent, clf)
          .addToBackStack(null).commit();
    }
  }

  @Override
  public boolean onCreateOptionsMenu(final Menu menu) {
    // Inflate the menu; this adds items to the action bar if it is present.
    getMenuInflater().inflate(R.menu.main, menu);
    return true;
  }

  @Override
  public boolean onOptionsItemSelected(final MenuItem item) {
    switch (item.getItemId()) {
    case R.id.action_search:
      return true;
    default:
      return super.onOptionsItemSelected(item);
    }
  }

  public void sendMessage(final View view) {
    final Intent intent = new Intent(this, DisplayMessageActivity.class);
    final EditText editText = (EditText) findViewById(R.id.edit_message);
    final String message = editText.getText().toString();
    intent.putExtra(EXTRA_MESSAGE, message);
    startActivity(intent);
  }

}
