import React from "react";
import Button from "@mui/material/Button";
import CssBaseline from "@mui/material/CssBaseline";
import TextField from "@mui/material/TextField";
import Box from "@mui/material/Box";
import Typography from "@mui/material/Typography";
import Container from "@mui/material/Container";
import { createTheme, ThemeProvider } from "@mui/material/styles";
import { useFormik } from "formik";
import { invitationSchema } from "../../../utils";
import Error from "../../../components/error";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import Header from "../../UI/Header";
interface Invitation {
  email: string;
}

const defaultTheme = createTheme();

export default function NewInvitation() {
  const navigate = useNavigate();
  const token = localStorage.getItem("token");
  const headers: any = {
    "Content-Type": "application/json",
    Authorization: `Bearer ${token}`,
  };

  const formik = useFormik({
    initialValues: {
      email: "",
    },
    validationSchema: invitationSchema,
    onSubmit: (values: Invitation) => {
      axios
        .post("/invitations.json", { invitation: values }, { headers: headers })
        .then((response) => {
          navigate("/dashboard");
        })
        .catch((error) => {
          console.error(error);
        });
    },
  });

  const { values, handleChange, handleBlur, handleSubmit, errors, touched } =
    formik;

  return (
    <>
      <Header />
      <ThemeProvider theme={defaultTheme}>
        <Container component="main" maxWidth="xs">
          <CssBaseline />
          <Box
            sx={{
              marginTop: 8,
              display: "flex",
              flexDirection: "column",
              alignItems: "center",
            }}
          >
            <Typography component="h1" variant="h5">
              New Invitation
            </Typography>
            <Box
              component="form"
              onSubmit={handleSubmit}
              noValidate
              sx={{ mt: 1 }}
            >
              <TextField
                margin="normal"
                required
                fullWidth
                id="email"
                label="Email Address"
                name="email"
                autoComplete="email"
                autoFocus
                onBlur={handleBlur}
                onChange={handleChange}
                value={values.email}
              />
              <Error error={errors?.email} touched={touched?.email} />
              <Button
                type="submit"
                fullWidth
                variant="contained"
                sx={{ mt: 3, mb: 2, backgroundColor: "#00ABE4" }}
              >
                Send Invite
              </Button>
            </Box>
          </Box>
        </Container>
      </ThemeProvider>
    </>
  );
}
