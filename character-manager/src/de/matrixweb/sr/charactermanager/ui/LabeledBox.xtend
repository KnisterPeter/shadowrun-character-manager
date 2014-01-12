package de.matrixweb.sr.charactermanager.ui

import android.widget.LinearLayout
import android.content.Context
import android.util.AttributeSet
import android.view.LayoutInflater
import de.matrixweb.sr.charactermanager.R
import android.widget.TextView

/**
 * @author markusw
 */
class LabeledBox extends LinearLayout {
  
  TextView label
  
  new(Context context) {
    this(context, null)
  }
  
  new(Context context, AttributeSet attrs) {
    this(context, attrs, 0)
  }
  
  new(Context context, AttributeSet attrs, int defStyle) {
    super(context, attrs, defStyle)
    orientation = LinearLayout::VERTICAL;
    (context.getSystemService(Context.LAYOUT_INFLATER_SERVICE) as LayoutInflater).inflate(R.layout.custom_labeled_box, this, true)
    label = findViewById(R.id.label) as TextView
    if (attrs != null) {
      val a = context.obtainStyledAttributes(attrs, R.styleable.LabeledTextView)
      setLabel(a.getString(R.styleable.LabeledTextView_label))
    }
  }
  
  def getLabel() {
    label.text
  }
  
  def void setLabel(String label) {
    this.label.text = label?.toUpperCase ?: ''
  }
  
}
