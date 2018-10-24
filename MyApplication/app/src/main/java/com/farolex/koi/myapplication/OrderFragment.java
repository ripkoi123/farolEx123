package com.farolex.koi.myapplication;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.Toast;

import java.util.ArrayList;

public class OrderFragment extends Fragment{
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";
    Spinner items1;
    Spinner items2;
    Button btnAdd;
    ListView lView;
    private String mParam1;
    private String mParam2;
    private OnFragmentInteractionListener mListener;
    public OrderFragment() {
        // Required empty public constructor
    }
    public static OrderFragment newInstance(String param1, String param2) {
        OrderFragment fragment = new OrderFragment();
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
        View view = inflater.inflate(R.layout.fragment_order,container,false);
        final Aldito aldito =new Aldito();
        items1 = (Spinner) view.findViewById(R.id.sp1);
        items2 = (Spinner) view.findViewById(R.id.sp2);
        btnAdd = (Button) view.findViewById(R.id.btnAdd);
        lView = (ListView) view.findViewById(R.id.lView);
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(getActivity(), R.array.items1, R.layout.support_simple_spinner_dropdown_item);
        ArrayAdapter<CharSequence> adapter1 = ArrayAdapter.createFromResource(getActivity(), R.array.items2, R.layout.support_simple_spinner_dropdown_item);
        final ArrayList<String> listOrder = new ArrayList<>();
        items1.setAdapter(adapter);
        items2.setAdapter(adapter1);
        btnAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                listOrder.add(items1.getSelectedItem().toString()+" Cant: "+items2.getSelectedItem().toString());
                ArrayAdapter<String> listAdapter = new ArrayAdapter(getActivity(),android.R.layout.simple_list_item_1,listOrder);
                lView.setAdapter(listAdapter);
            }
        });
        Button btnOrder = view.findViewById(R.id.btnOrder);
        btnOrder.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(listOrder.isEmpty()){
                    aldito.shToast("No hay ningún producto en la orden",getActivity());
                }else{
                    String chain="";
                    for(int i=0;i<listOrder.size();i++){
                         chain+= listOrder.get(i)+" ";
                    }
                    aldito.shAlert("Usted pidio:                                            "+chain+" ¿Es correcto?",getActivity());
                }
            }
        });
        return view;
    }

    public void onButtonPressed(Uri uri) {
        if (mListener != null) {
            mListener.onFragmentInteraction(uri);
        }
    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        if (context instanceof OnFragmentInteractionListener) {
            mListener = (OnFragmentInteractionListener) context;
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

