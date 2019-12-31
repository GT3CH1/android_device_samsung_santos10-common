/*
 * Copyright (C) 2012 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.lineageos.settings.device;

import android.content.Context;
import android.content.res.Resources;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceCategory;
import android.preference.PreferenceFragment;
import android.preference.PreferenceManager;
import android.preference.PreferenceScreen;
import android.util.Log;

import org.lineageos.settings.device.R;

public class ScreenFragmentActivity extends PreferenceFragment {

    private static final String PREF_ENABLED = "1";
    private static final String TAG = "AdvancedSettings_Screen";
    private mDNIeScenario mmDNIeScenario;
    private mDNIeNegative mmDNIeNegative;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        addPreferencesFromResource(R.xml.screen_preferences);
        PreferenceScreen preferenceScreen = getPreferenceScreen();
        Resources res = getResources();

        /* mDNIe */
        mmDNIeScenario = (mDNIeScenario) findPreference(AdvancedSettings.KEY_MDNIE_SCENARIO);
        mmDNIeScenario.setEnabled(mDNIeScenario.isSupported(res.getString(R.string.mdnie_scenario_sysfs_file)));

        mmDNIeNegative = (mDNIeNegative) findPreference(AdvancedSettings.KEY_MDNIE_NEGATIVE);
        mmDNIeNegative.setEnabled(mDNIeNegative.isSupported(res.getString(R.string.mdnie_negative_sysfs_file)));

    }

    @Override
    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {

        String key = preference.getKey();
        Log.w(TAG, "key: " + key);

        return true;
    }

    public static boolean isSupported(String filePath) {
        return FileUtils.isFileWritable(filePath);
    }

    public static void restore(Context context) {
        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
    }
}