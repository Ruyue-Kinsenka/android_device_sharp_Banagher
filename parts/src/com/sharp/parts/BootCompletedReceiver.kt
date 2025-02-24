package com.sharp.parts

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.util.Log
import androidx.preference.PreferenceManager


class BootCompletedReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
    }

    companion object {
        private const val DEBUG = false
        private const val TAG = "SHARPParts"
    }
}
