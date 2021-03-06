package com.farolex.koi.myapplication;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.Toast;

public class RegisterFragment extends Fragment {
        private static final String ARG_PARAM1 = "param1";
        private static final String ARG_PARAM2 = "param2";
        private String mParam1;
        private String mParam2;

        private com.farolex.koi.myapplication.RegisterFragment.OnFragmentInteractionListener mListener;

        public RegisterFragment() {
            // Required empty public constructor
        }
        public static com.farolex.koi.myapplication.RegisterFragment newInstance(String param1, String param2) {
            com.farolex.koi.myapplication.RegisterFragment fragment = new com.farolex.koi.myapplication.RegisterFragment();
            Bundle args = new Bundle();
            args.putString(ARG_PARAM1, param1);
            args.putString(ARG_PARAM2, param2);
            fragment.setArguments(args);
            return fragment;
        }

        @Override
        public void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            if (getArguments() != null) {
                mParam1 = getArguments().getString(ARG_PARAM1);
                mParam2 = getArguments().getString(ARG_PARAM2);
            }
        }

        @Override
        public View onCreateView(LayoutInflater inflater, ViewGroup container,
                                 Bundle savedInstanceState) {
            // Inflate the layout for this fragment
            return inflater.inflate(R.layout.fragment_register, container, false);
        }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        Button btnRegister = (Button)view.findViewById(R.id.btnRegister);
        final Aldito aldito = new Aldito();
        btnRegister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                aldito.shToast("Registrado Exitosamente", getActivity());
            }
        });
    }

    public void onButtonPressed(Uri uri) {
            if (mListener != null) {
                mListener.onFragmentInteraction(uri);
            }
        }

        @Override
        public void onAttach(Context context) {
            super.onAttach(context);
            if (context instanceof com.farolex.koi.myapplication.RegisterFragment.OnFragmentInteractionListener) {
                mListener = (com.farolex.koi.myapplication.RegisterFragment.OnFragmentInteractionListener) context;
            } else {
                throw new RuntimeException(context.toString()
                        + " must implement OnFragmentInteractionListener");
            }
        }

        @Override
        public void onDetach() {
            super.onDetach();
            mListener = null;
        }
        public interface OnFragmentInteractionListener {
            void onFragmentInteraction(Uri uri);
        }
    }
