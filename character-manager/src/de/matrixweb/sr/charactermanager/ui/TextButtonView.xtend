package de.matrixweb.sr.charactermanager.ui

import android.widget.LinearLayout
import android.widget.TextView
import android.widget.Button
import android.content.Context
import android.util.AttributeSet
import android.view.LayoutInflater
import de.matrixweb.sr.charactermanager.R

/**
 * @author markusw
 */
class TextButtonView extends LinearLayout {
  
  TextView name
  
  Button button
  
  new(Context context) {
    this(context, null)
  }
  
  new(Context context, AttributeSet attrs) {
    this(context, attrs, 0)
  }
  
  new(Context context, AttributeSet attrs, int defStyle) {
    super(context, attrs, defStyle)
    (context.getSystemService(Context.LAYOUT_INFLATER_SERVICE) as LayoutInflater).inflate(R.layout.custom_text_button_row, this, true)
    name = findViewById(R.id.name) as TextView
    button = findViewById(R.id.button) as Button
  }
  
  def setName(String name) {
    this.name.text = name
  }
  
  def setButton(String name) {
    this.button.text = name
  }
  
}
