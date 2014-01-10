package de.matrixweb.sr.charactermanager;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.TextView;

public class DisplayMessageActivity extends Activity {

  @Override
  protected void onCreate(final Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_display_message);
    // Show the Up button in the action bar.
    setupActionBar();

    final TextView textView = (TextView) findViewById(R.id.text_view);
    textView.setText(getIntent().getStringExtra(MainActivity.EXTRA_MESSAGE));
  }

  /**
   * Set up the {@link android.app.ActionBar}.
   */
  private void setupActionBar() {
    getActionBar().setDisplayHomeAsUpEnabled(true);
  }

  @Override
  public boolean onCreateOptionsMenu(final Menu menu) {
    // Inflate the menu; this adds items to the action bar if it is present.
    getMenuInflater().inflate(R.menu.display_message, menu);
    return true;
  }

  @Override
  public boolean onOptionsItemSelected(final MenuItem item) {
    switch (item.getItemId()) {
    case android.R.id.home:
      // This ID represents the Home or Up button. In the case of this
      // activity, the Up button is shown. Use NavUtils to allow users
      // to navigate up one level in the application structure. For
      // more details, see the Navigation pattern on Android Design:
      //
      // http://developer.android.com/design/patterns/navigation.html#up-vs-back
      //
      // NavUtils.navigateUpFromSameTask(this);
      navigateUpTo(getIntent());
      return true;
    }
    return super.onOptionsItemSelected(item);
  }

}
