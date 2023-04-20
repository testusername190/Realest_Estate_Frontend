import React from 'react';
import {BrowserRouter as Router,Routes,Route} from 'react-router-dom';
import Layout from './hocs/Layout';
import Home from './containers/Home';
import About from './containers/About';
import Contact from './containers/Contact';
import ListingDetail from './containers/ListingDetail';
import Listings from './containers/Listings';
import Login from './containers/Login';
import SignUp from './containers/SignUp';
import NotFound from './components/NotFound';
import './sass/main.scss';
import {Provider} from 'react-redux';
import store from './store';
import PrivateRoute from './components/privateRoute';

 

const App=()=> (
  <Provider store={store}>
  <Router>
      <Layout>
        <Routes>
          <Route exact path='/' Component={Home}/>
          <Route exact path='/about' Component={About}/>
          <Route exact path='/listings' Component={Listings}/>
          <Route exact path='/contact' Component={Contact}/>
          <Route exact path='/listings/:id' Component={ListingDetail}/>
          <Route exact path='/login' Component={Login}/>
          <Route exact path='/signup' Component={SignUp}/>
          {/* <Route Component={NotFound}/> */}
          <Route path="*" element={<NotFound/>} />
        </Routes>
      </Layout>
  </Router>
  </Provider>
);
 
export default App;
