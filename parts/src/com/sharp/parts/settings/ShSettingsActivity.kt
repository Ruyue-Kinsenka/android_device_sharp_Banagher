package com.sharp.parts.settings

import android.os.Bundle
import com.android.settingslib.collapsingtoolbar.CollapsingToolbarBaseActivity
import com.android.settingslib.widget.R

class ShSettingsActivity : CollapsingToolbarBaseActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        getFragmentManager().beginTransaction().replace(
            R.id.content_frame,
            ShSettingsFragment(), TAG
        ).commit()
    }

    companion object {
        private const val TAG = "SHARP"
    }
}
