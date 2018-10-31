package com.farolex.koi.myapplication;

import android.net.Uri;
import android.os.Bundle;
import android.support.design.widget.NavigationView;
import android.support.v4.app.Fragment;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;

public class MainActivity extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener,
        OrderFragment.OnFragmentInteractionListener,
        UbicationFragment.OnFragmentInteractionListener,
        PayFragment.OnFragmentInteractionListener,
        ProfileFragment.OnFragmentInteractionListener,
        ContactFragment.OnFragmentInteractionListener,
        RegisterFragment.OnFragmentInteractionListener,
        MainFragment.OnFragmentInteractionListener,
        LoginFragment.OnFragmentInteractionListener,
        ResetFragment.OnFragmentInteractionListener{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.addDrawerListener(toggle);
        toggle.syncState();
        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);
        getSupportFragmentManager().beginTransaction().replace(R.id.Container, new MainFragment()).commit();
    }

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        int id = item.getItemId();
        Fragment fragment = null;
        Boolean fragSelected = false;
        if (id == R.id.nav_order) {
            fragment = new OrderFragment();
            fragSelected=true;
        } else if (id == R.id.nav_home) {
            fragment = new MainFragment();
            fragSelected=true;
        } else if (id == R.id.nav_ubication) {
            fragment = new UbicationFragment();
            fragSelected=true;
        } else if (id == R.id.nav_pay) {
            fragment = new PayFragment();
            fragSelected=true;
        } else if (id == R.id.nav_profile) {
            fragment = new ProfileFragment();
            fragSelected=true;
        } else if (id == R.id.nav_contact) {
            fragment = new ContactFragment();
            fragSelected=true;
        } else if (id == R.id.nav_exit) {
            finish();
            System.exit(0);
        }
            if(fragSelected){
                getSupportFragmentManager().beginTransaction().addToBackStack("LoginFragment").replace(R.id.Container, fragment).commit();
            }
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }

    @Override
    public void onFragmentInteraction(Uri uri) {

    }
}
