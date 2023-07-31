import streamlit as st
import open3d as o3d


st.title("Upload STL file")

uploadedFile = st.file_uploader("Upload a STL:",["stl"], accept_multiple_files=False)


if uploadedFile:
    st.write('Area calculated from uploaded file:')
    with open('file.stl', 'wb') as f:
        f.write(uploadedFile.getbuffer())
    mesh = o3d.io.read_triangle_mesh("file.stl")
    get_surface_area = mesh.get_surface_area()

    st.write(get_surface_area)



hide_streamlit_style = """
            <style>
            #MainMenu {visibility: hidden;}
            footer {visibility: hidden;}
            </style>
            """
st.markdown(hide_streamlit_style, unsafe_allow_html=True)