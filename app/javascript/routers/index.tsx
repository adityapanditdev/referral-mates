import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Home from "../components/Home";
import SignIn from "../components/pages/SignIn/SignIn";
import SignUp from "../components/pages/SignUp/SignUp";
import DashBoard from "../components/pages/Dashboard/Dashboard";
import NewInvitation from "../components/pages/NewInvitation/NewInvitation";
import PrivateRoute from "./privateRoute";

function Index() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/signin" element={<SignIn />} />
        <Route path="/signup" element={<SignUp />} />
        <Route
          path="/dashboard"
          element={<PrivateRoute component={DashBoard} />}
        />
        <Route
          path="/new-invitation"
          element={<PrivateRoute component={NewInvitation} />}
        />
      </Routes>
    </Router>
  );
}

export default Index;
